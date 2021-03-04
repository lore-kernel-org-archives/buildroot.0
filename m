From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 4 Mar 2021 11:29:21 +0100
Subject: [Buildroot] Error building protobuf for 32 bit target (i386) on
 64 bit host
In-Reply-To: <1270967211.314691.1614834524261@mail.yahoo.com>
References: <1270967211.314691.1614834524261.ref@mail.yahoo.com>
 <1270967211.314691.1614834524261@mail.yahoo.com>
Message-ID: <868becaf-15f9-33a5-e507-e0f09d4054bf@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 04/03/2021 06:08, Tal Lubko via buildroot wrote:
> Hi
> When trying to build protobuf for i386 on 64 bit host I get the following error:...ld: /usr/gcc-6.2/lib/../lib64/libatomic.so: error adding symbols: file in wrong format

 This looks like it's using the host compiler to build a target package. That is
not good.

 Surprising, though, since this is a configuration we definitely test, and we've
never had any protobuf failures in the autobuilders [1]. Do you have local
modifications that could cause this?

 Can you share a defconfig that reproduces the issue, and a more extensive build
log (particularly the command used for the configure and build steps of protobuf).

 Regards,
 Arnout

[1] http://autobuild.buildroot.net/?reason=protobuf


> Any suggestions?
> Thanks,Tal
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
