From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 23 Jun 2021 08:33:05 +0200
Subject: [Buildroot] [PATCH 1/1] package/openswan: disable -Werror
In-Reply-To: <20210609201419.625739-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 9 Jun 2021 22:14:19 +0200")
References: <20210609201419.625739-1-fontaine.fabrice@gmail.com>
Message-ID: <87czsd6qfy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Disable -Werror to avoid the following build failure with -DNDEBUG
 > raised since commit 5a8c50fe05afacc3cbe8e7347e238da9f242fab0

 > /srv/storage/autobuild/run/instance-2/output-1/build/openswan-3.0.0/programs/rsasigkey/rsasigkey.c:524:6: error: variable 'success' set but not used [-Werror=unused-but-set-variable]
 >   524 |  int success;
 >       |      ^~~~~~~

 > Fixes:
 >  - http://autobuild.buildroot.org/results/327a0f2b8f0c51bcbb3edb1c3671870d593e93b9

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

While not strictly needed for 2021.02.x / 2021.05.x as they don't have
the NDEBUG logic, I still backported it to get rid of -Werror.

-- 
Bye, Peter Korsgaard
