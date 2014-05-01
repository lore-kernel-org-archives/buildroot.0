From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 01 May 2014 23:28:22 +0200
Subject: [Buildroot] [PATCH] fs: also chown symlinks
In-Reply-To: <1398977633-5512-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Thu, 1 May 2014 22:53:53 +0200")
References: <1398977633-5512-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87zjj1qjd5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > By default, chown does not change the ownership of symlinks.

 > In some cases, this can be seen by some as a leak from the building
 > environment into the generated filesystem (a small leak, but a leak
 > nonetheless.)

 > Change the way we call chown to tell it to not dereference symlinks.

 > [Thanks to Thomas for pointing out the -h option to chown.]

As discussed on IRC, chown actually does the right thing when called
with the -R option, so this patch doesn't make sense.

-- 
Bye, Peter Korsgaard
