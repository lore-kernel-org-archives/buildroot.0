From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 10 May 2013 20:43:41 +0200
Subject: [Buildroot] [PATCH 0/2] Fix build problem of pulseaudio
In-Reply-To: <1368119665-917-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Thu, 9 May 2013 19:14:23 +0200")
References: <1368119665-917-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87obci3cbm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Hello,
 Thomas> Here is a set of two patches that fix the pulseaudio link problem. It
 Thomas> turns out that the problem was that json-c and libjson both install a
 Thomas> library with the same name, /usr/lib/libjson.so, even though they have
 Thomas> a different API and language. So, when libjson was built and installed
 Thomas> after json-c, it was overriding json-c libjson.so link with a link to
 Thomas> its own library, and Pulseaudio was failing to build.

 Thomas> The solution is to bump json-c to 0.11, which changes its name to
 Thomas> libjson-c.so, and apply an upstream pulseaudio patch that makes
 Thomas> pulseaudio use json-c instead of json when available.

 Thomas> Best regards,

Committed both, thanks.

-- 
Bye, Peter Korsgaard
