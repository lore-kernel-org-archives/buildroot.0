From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 27 Oct 2014 13:53:48 -0300
Subject: [Buildroot] [PATCH 2/2] polarssl: disable assembly for more
	scenarios
In-Reply-To: <20141027174859.45788b19@free-electrons.com>
References: <1414418838-3487-1-git-send-email-gustavo@zacarias.com.ar>	<1414418838-3487-2-git-send-email-gustavo@zacarias.com.ar>
 <20141027174859.45788b19@free-electrons.com>
Message-ID: <544E789C.8090402@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/27/2014 01:48 PM, Thomas Petazzoni wrote:

> It's not really great to have to build things differently debugging on
> BR2_ENABLE_DEBUG, because the prompt of BR2_ENABLE_DEBUG is "build
> packages with debugging symbols". So the user may expect that we build
> the same set of features, just with debugging symbols.
> 
> Though I agree that with BR2_ENABLE_DEBUG also activating
> --enable-debug, a lot more than just debugging symbols actually happens.
> 
> Therefore, committed, thanks!

Well i'm not very happy to build things differently (asm vs no asm) if
debugging is on since it can change the result and make it pointless,
but it wouldn't be too good to disable asm in general for thumb either
so i threw the dice on the lesser evil.
Regards.
