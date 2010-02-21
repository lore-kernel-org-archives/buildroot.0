From: Will Newton <will.newton@gmail.com>
Date: Sun, 21 Feb 2010 18:10:11 +0000
Subject: [Buildroot] [PATCH 36/38] webkit: make sure that people don't
	try to build with uClibc
In-Reply-To: <1c517be59aac9a3569bd10769125d5f7229e0111.1266774432.git.thomas.petazzoni@free-electrons.com>
References: <cover.1266774432.git.thomas.petazzoni@free-electrons.com>
	<1c517be59aac9a3569bd10769125d5f7229e0111.1266774432.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87a5b0801002211010k3c846965t835414641992044b@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Feb 21, 2010 at 5:47 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:

Hi Thomas,

> Currently, webkit uses the pthread_getattr_np() function (in
> JavaScriptCore/runtime/Collector.cpp), and this function isn't
> implemented by uClibc (see pthread.h).

This isn't strictly true - the newer version of LinuxThreads and NPTL
for uClibc both implement this function.

I build and run WebKit with uClibc so I would rather this change did not go in.

Thanks,
