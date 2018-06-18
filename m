From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Mon, 18 Jun 2018 20:33:20 +0200
Subject: [Buildroot] Rust test too long
In-Reply-To: <20180610165740.1221b491@windsurf>
References: <20180610165740.1221b491@windsurf>
Message-ID: <20180618183320.GA13225@itchy>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

On 2018-06-10 16:57, Thomas Petazzoni wrote:
> Hello Eric,
>
> The tests.package.test_rust.TestRust test case takes more than 3 hours
> and Gitlab, and causes the overall test suite to always fail:
>
>   https://gitlab.com/buildroot.org/buildroot/pipelines/23578303/failures
>
> (This one also has a failure related to check-package caused by the
> mender package, but I've fixed that)
>
> Is this expected that this test takes as much as 3 hours ? Is there
> something we can do to reduce this ?

What is the horsepower of the Gitlab instance?

When building rust from source, the longest part is building the LLVM
backend.

On a 4-core i5-7500 CPU @ 3.40GHz, TestRust takes 60 minutes. But on a
4-core i3-4010U CPU @ 1.70GHz, it does takes nearly 3 hours...

Regards.

--
ELB
