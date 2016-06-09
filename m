From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Jun 2016 23:11:42 +0200
Subject: [Buildroot] Static + PIE support
In-Reply-To: <20160609231005.6b289f42@free-electrons.com>
References: <20160609000939.63366906@free-electrons.com>
 <20160609210130.GP6825@waldemar-brodkorb.de>
 <20160609231005.6b289f42@free-electrons.com>
Message-ID: <20160609231142.2b5e63ed@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 9 Jun 2016 23:10:05 +0200, Thomas Petazzoni wrote:

> I agree that PIE should be optional, but I'm not sure if it's flannel
> itself that decides to be built with PIE, or just the whole Go stuff.

It's Go. I found again the piece of code that was pointed to me by
Geoff. See https://golang.org/src/cmd/go/build.go, line 3188:

   pie := (goarch == "arm" && goos == "linux") || goos == "android"

So for some reason, on ARM, PIE is forced enabled.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
