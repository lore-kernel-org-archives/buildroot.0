From: Brendan Heading <brendanheading@gmail.com>
Date: Tue, 21 Jul 2015 01:16:16 +0100
Subject: [Buildroot] [PATCH] autobuild - acpid does not build against
	musl
In-Reply-To: <20150720224152.11d13fa5@free-electrons.com>
References: <1437417346-18621-1-git-send-email-brendanheading@gmail.com>
 <20150720224152.11d13fa5@free-electrons.com>
Message-ID: <CA+BsyQ7vZTqjt9OKgj_tcBTx=rC9zHCxzmN4wSPJ=20TD=MRwA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 20 July 2015 at 21:41, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Brendan Heading,
>
> The commit title should be:
>
>         acpid: fix build against musl

Hi Thomas,

I think the best course with this problem is to have a chat with the
upstream musl guys (first choice) or patch the buildroot musl
toolchain (second choice).

The absence of TEMP_FAILURE_RETRY will break more than one package so
in retrospect it's probably more cleaner to try to fix it properly
rather than add patches to every package where it shows up. The only
downside is that acpid will be broken until it's resolved.

regards

Brendan
