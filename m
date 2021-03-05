From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 5 Mar 2021 09:31:24 +0100
Subject: [Buildroot] Error building protobuf for 32 bit target (i386) on
 64 bit host
In-Reply-To: <868becaf-15f9-33a5-e507-e0f09d4054bf@mind.be>
References: <1270967211.314691.1614834524261.ref@mail.yahoo.com>
 <1270967211.314691.1614834524261@mail.yahoo.com>
 <868becaf-15f9-33a5-e507-e0f09d4054bf@mind.be>
Message-ID: <CAAXf6LW7JY6QbPY4eu-JwmquHruoeAQPZ7M2yHGpsoV14ncvgQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

El jue, 4 mar 2021 a las 21:54, Arnout Vandecappelle
(<arnout@mind.be>) escribi?:
>
>
>
> On 04/03/2021 06:08, Tal Lubko via buildroot wrote:
> > Hi
> > When trying to build protobuf for i386 on 64 bit host I get the following error:...ld: /usr/gcc-6.2/lib/../lib64/libatomic.so: error adding symbols: file in wrong format
>
>  This looks like it's using the host compiler to build a target package. That is
> not good.
>
>  Surprising, though, since this is a configuration we definitely test, and we've
> never had any protobuf failures in the autobuilders [1]. Do you have local
> modifications that could cause this?
>

I can confirm that an i386 defconfig with protobuf builds fine on a
64-bit host, at least in my situation.
My guess is either a local change, or a change in configuration
without starting from a clean build.

Best regards,
Thomas
