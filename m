From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 Nov 2017 20:53:06 +0100
Subject: [Buildroot] [PATCH] core/reproducible: do not override
 SOURCE_DATE_EPOCH
In-Reply-To: <20171105091456.5277-1-yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Sun, 5 Nov 2017 10:14:56 +0100")
References: <20171105091456.5277-1-yann.morin.1998@free.fr>
Message-ID: <87efokizq5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > SOURCE_DATE_EPOCH is currently forcibly set (to either the git commit
 > date, or the last release date).

 > However, the spec mandates that it should not be modified if already
 > set: https://reproducible-builds.org/specs/source-date-epoch/

 >     Build systems MUST NOT overwrite this variable for child
 >     processes to consume if it is already present.

 > Abide by the rule, and only set it if not already set.

 > This will allow users to pass it from an upper-layer buildsystem (e.g. a
 > jenkins or gitlab-ci job, for example), when they have a reson to do so.

Committed to 2017.02.x and 2017.08.x, thanks.

-- 
Bye, Peter Korsgaard
