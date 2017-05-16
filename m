From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 16 May 2017 15:48:39 +0200
Subject: [Buildroot] Analysis of build results for 2017-05-15
In-Reply-To: <20170516092240.1cf6a3e6@free-electrons.com>
References: <20170516063043.79C252213B@mail.free-electrons.com>
 <20170516092240.1cf6a3e6@free-electrons.com>
Message-ID: <CAMRc=MfpfRv9GxzhXw8qVNLi6iuBPoFCTYCExWZajM0b+LkrHw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2017-05-16 9:22 GMT+02:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
>
>>       x86_64 |                pulseview-0.3.0 | NOK | http://autobuild.buildroot.net/results/e9f3f175e203529c44ecf92a34b82a0b3a473e34 |
>
> This has been occurring for a while. Anybody to have a look?
>

This can be easily fixed by changing the -std=c++11 flag to
-std=gnu++11 or adding -fext-numeric-literals in CMakeLists.txt (just
like the error message is telling to). Seems like a problem with the
boost math stuff (BOOST_MATH_BIG_CONSTANT).

I'll prepare a patch.

Best regards,
Bartosz Golaszewski
