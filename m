From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 19 Feb 2021 13:42:37 +0100
Subject: [Buildroot] [PATCH 1/1] package/go: bump version to 1.16
In-Reply-To: <CA+h8R2p3c0Ds1r-f-o3o8RJ-vpYMP24QRxiWvDRoFh2Uk-_64g@mail.gmail.com>
 (Christian Stewart's message of "Fri, 19 Feb 2021 04:27:45 -0800")
References: <20210217222154.2144796-1-christian@paral.in>
 <87o8ghy83l.fsf@dell.be.48ers.dk>
 <CA+h8R2qMgxTZUnmqb1T3XeifcXzjm4b+U=vQ49GKhQHmw40s0g@mail.gmail.com>
 <87lfbkuu0t.fsf@dell.be.48ers.dk>
 <CA+h8R2p3c0Ds1r-f-o3o8RJ-vpYMP24QRxiWvDRoFh2Uk-_64g@mail.gmail.com>
Message-ID: <87blcgut36.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Christian" == Christian Stewart <christian@paral.in> writes:

 > Hi Peter,
 > On Fri, Feb 19, 2021 at 4:22 AM Peter Korsgaard <peter@korsgaard.com> wrote:
 >> >  As announced in the Go 1.15 release notes, Go 1.16 drops support for
 >> > x87 mode compilation (GO386=387). Support for non-SSE2 processors is
 >> > now available using soft float mode (GO386=softfloat). Users running
 >> > on non-SSE2 processors should replace GO386=387 with GO386=softfloat.
 >> 
 >> > We don't set GO386 so it doesn't apply.
 >> 
 >> But using SSE2 presumably means that go applications built for i386 will
 >> only run on machines with SSE2 support, so as a minimum we need to
 >> adjust BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS to ensure go is not
 >> available on older i386 variants?

 > Better to just set GO386=softfloat for older i386 variants without SSE2.

 > IMO, this seems like a separate issue from the version bump.

Why? Isn't that new behaviour? If so, this should be fixed as part of
the version bump.

-- 
Bye, Peter Korsgaard
