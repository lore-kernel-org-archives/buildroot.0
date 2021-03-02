From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 02 Mar 2021 09:34:38 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/redis: security bump to
 v6.0.12
In-Reply-To: <20210302081241.173569-1-titouanchristophe@gmail.com> (Titouan
 Christophe's message of "Tue, 2 Mar 2021 09:12:41 +0100")
References: <20210302081241.173569-1-titouanchristophe@gmail.com>
Message-ID: <87ft1ekl7l.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Titouan" == Titouan Christophe <titouanchristophe@gmail.com> writes:

 > From the release notes:
 > (https://github.com/redis/redis/blob/6.0.12/00-RELEASENOTES)

 > ================================================================================
 > Redis 6.0.11     Released Mon Feb 22 16:13:23 IST 2021
 > ================================================================================

 > Upgrade urgency: SECURITY if you use 32bit build of redis (see bellow), LOW
 > otherwise.

 > Integer overflow on 32-bit systems (CVE-2021-21309):
 > Redis 4.0 or newer uses a configurable limit for the maximum supported bulk
 > input size. By default, it is 512MB which is a safe value for all platforms.
 > If the limit is significantly increased, receiving a large request from a client
 > may trigger several integer overflow scenarios, which would result with buffer
 > overflow and heap corruption.

 > ================================================================================
 > Redis 6.0.12     Released Mon Mar  1 17:29:52 IST 2021
 > ================================================================================

 > Upgrade urgency: LOW, fixes a compilation issue.

 > Bug fixes:
 > * Fix compilation error on non-glibc systems if jemalloc is not used (#8533)

 > Signed-off-by: Titouan Christophe <titouanchristophe@gmail.com>
 > ---
 > Changes v1->v2:
 > * Version bump within the 6.0 series (6.0.11 and 6.0.12) instead of 6.2.0
 > * Remove patch that has been applied in 6.0.12

Committed, thanks.

-- 
Bye, Peter Korsgaard
