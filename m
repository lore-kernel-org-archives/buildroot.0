From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 26 Nov 2015 22:23:03 +0100
Subject: [Buildroot] BR2_ROOTFS_MERGED_USR and gdb
In-Reply-To: <CAMOMa6N-h2JaWhA96f2JE12Nq1i4aFC2p8t4LLDB1X44Txh3Rg@mail.gmail.com>
 (Pieterjan Camerlynck's message of "Wed, 25 Nov 2015 14:53:36 +0100")
References: <CAMOMa6N-h2JaWhA96f2JE12Nq1i4aFC2p8t4LLDB1X44Txh3Rg@mail.gmail.com>
Message-ID: <878u5kv4js.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Pieterjan" == Pieterjan Camerlynck <pieterjan.camerlynck@gmail.com> writes:

 > Hi,
 > Since the introduction of BR2_ROOTFS_MERGED_USR, /lib is now a symlink
 > to /usr/lib on the target. In the sysroot directory however, /lib and
 > /usr/lib are separate directories.

 > When remote debugging, this causes gdb to search only for libraries in
 > /lib under the sysroot directory.
 > Is there a way to fix this situation other than using "set solib-search-path"?

Thanks for the report. I guess we'll need to do the same merged-usr
handling (and workarounds) we do for the target directory also for
staging.

Yann is looking into it, but it is nontrivial so it will most likely not
make it for 2015.11.

-- 
Bye, Peter Korsgaard
