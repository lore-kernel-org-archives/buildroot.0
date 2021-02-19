From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 19 Feb 2021 13:22:26 +0100
Subject: [Buildroot] [PATCH 1/1] package/go: bump version to 1.16
In-Reply-To: <CA+h8R2qMgxTZUnmqb1T3XeifcXzjm4b+U=vQ49GKhQHmw40s0g@mail.gmail.com>
 (Christian Stewart's message of "Fri, 19 Feb 2021 03:52:12 -0800")
References: <20210217222154.2144796-1-christian@paral.in>
 <87o8ghy83l.fsf@dell.be.48ers.dk>
 <CA+h8R2qMgxTZUnmqb1T3XeifcXzjm4b+U=vQ49GKhQHmw40s0g@mail.gmail.com>
Message-ID: <87lfbkuu0t.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Christian" == Christian Stewart <christian@paral.in> writes:

 > On Thu, Feb 18, 2021 at 2:37 AM Peter Korsgaard <peter@korsgaard.com> wrote:
 >> 
 >> >>>>> "Christian" == Christian Stewart <christian@paral.in> writes:
 >> 
 >> > Release notes: https://golang.org/doc/go1.16
 >> 
 >> The release notes mention changes for i386 machines without SSE support,
 >> but you don't seem to be handling that?

 > I guess you're talking about this section:

 >  As announced in the Go 1.15 release notes, Go 1.16 drops support for
 > x87 mode compilation (GO386=387). Support for non-SSE2 processors is
 > now available using soft float mode (GO386=softfloat). Users running
 > on non-SSE2 processors should replace GO386=387 with GO386=softfloat.

 > We don't set GO386 so it doesn't apply.

But using SSE2 presumably means that go applications built for i386 will
only run on machines with SSE2 support, so as a minimum we need to
adjust BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS to ensure go is not
available on older i386 variants?

-- 
Bye, Peter Korsgaard
