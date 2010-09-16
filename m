From: Marc Leclerc <marc-leclerc@signaturealpha.com>
Date: Thu, 16 Sep 2010 16:07:26 -0400
Subject: [Buildroot] Problem running program compiled with the toolchain
Message-ID: <4C9278FE.2010504@signaturealpha.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



Hi,

I have built an x86 embedded system using buildroot 2010.08. I have been
trying a few lib&  compiler version trying to find the problem without
success then I added gdb to the target to see if I could get more info

First I tried my application which was developped in the past year
compiled with the buildroot toolchain and it wont start (either illegal
instruction or segfault (seems to change if I use static linking). weird
thing is that the library examples do run and I am using those same
libraries and makefile based on theirs.

I then tried a simple app

int main (int argc, char **argv)
{
     return 0;
}

and I get a segfault at 1 ip 00000001 ...
adding a printf I get Illegal instruction

running under gdb amazingly tells me that the file is not in executable
format: File format not recognized

This app starts on my host and is recognized
The demos do start as well

Oviously I am missing something here, could anyone ring my bell

Regards
