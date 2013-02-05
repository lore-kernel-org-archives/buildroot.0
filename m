From: hayate <hayatelee@gmail.com>
Date: Tue, 5 Feb 2013 14:24:55 +0800
Subject: [Buildroot] bug report: c++ programs built by toolchain crash by
	seg fault
Message-ID: <CAJXWAwwHVddYF3StQByTW99aCDksiAwyOa_WdM7AbjGu3i6iJg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

menuconfig:

arm little endian; generic arm; OABI; gcc 4.6.3 with c++ support;
uclibc 0.9.31.1
others are unchanged

building is successful

test c++ program

int main()
{
    delete new int(2);
}

# arm-buildroot-linux-uclibc-g++ -static test.cpp
# qemu-arm ./a.out
qemu: uncaught target signal 11 (Segmentation fault) - core dumped
Segmentation fault (core dumped)

noted that some other programs not involved new and delete run correctly

I'm not sure if this is gcc upstream problem, but post it here for
confirmation
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130205/6ce89536/attachment.html>
