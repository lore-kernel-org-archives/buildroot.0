From: Christian Stewart <christian@paral.in>
Date: Fri, 19 Feb 2021 03:52:12 -0800
Subject: [Buildroot] [PATCH 1/1] package/go: bump version to 1.16
In-Reply-To: <87o8ghy83l.fsf@dell.be.48ers.dk>
References: <20210217222154.2144796-1-christian@paral.in>
 <87o8ghy83l.fsf@dell.be.48ers.dk>
Message-ID: <CA+h8R2qMgxTZUnmqb1T3XeifcXzjm4b+U=vQ49GKhQHmw40s0g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Feb 18, 2021 at 2:37 AM Peter Korsgaard <peter@korsgaard.com> wrote:
>
> >>>>> "Christian" == Christian Stewart <christian@paral.in> writes:
>
>  > Release notes: https://golang.org/doc/go1.16
>
> The release notes mention changes for i386 machines without SSE support,
> but you don't seem to be handling that?

I guess you're talking about this section:

 As announced in the Go 1.15 release notes, Go 1.16 drops support for
x87 mode compilation (GO386=387). Support for non-SSE2 processors is
now available using soft float mode (GO386=softfloat). Users running
on non-SSE2 processors should replace GO386=387 with GO386=softfloat.

We don't set GO386 so it doesn't apply.

Best,
Christian
