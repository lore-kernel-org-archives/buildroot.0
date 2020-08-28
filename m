From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Aug 2020 22:14:00 +0200
Subject: [Buildroot] [PATCH] linux: workaround make-4.1 bug
In-Reply-To: <20200826113759.27193-1-yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Wed, 26 Aug 2020 13:37:59 +0200")
References: <20200826113759.27193-1-yann.morin.1998@free.fr>
Message-ID: <871rjqmstz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > On Ubuntu 18.04, make-4.1 emits spurious, incorrect "entering/leaving"
 > messages, which end up in the LINUX_VERSION_PROBED variable:

 >     printf 'probed linux version: "%s"\n' "$(LINUX_VERSION_PROBED)"
 >     probed linux version: "make[1]: Entering directory '/home/buildroot'
 >     4.19.78-linux4sam-6.2
 >     make[1]: Leaving directory '/home/buildroot/output/build/linux-linux4sam_6.2'"


Funky. Do you know if this is caused by an Ubuntu specific patch or also
happens with upstream 4.1? Is it fixed in later versions? I don't seem
to see it in the list of fixes in 4.2:

https://savannah.gnu.org/bugs/index.php?group=make&report_id=111&fix_release_id=106&set=custom

Anyway, committed - Thanks.

-- 
Bye, Peter Korsgaard
