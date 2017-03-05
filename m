From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Mar 2017 09:29:20 +0100
Subject: [Buildroot] [PATCH 1/5] support/testing: core testing
 infrastructure
In-Reply-To: <dfb7a87b-6580-384d-81fb-e79f97e6b897@lucaceresoli.net>
References: <1486467363-19881-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1486467363-19881-2-git-send-email-thomas.petazzoni@free-electrons.com>
 <CAAXf6LXnRWvi3i0B2q1r_gRjgTkyNjXhdSasMLyYiFrr3=RTWg@mail.gmail.com>
 <20170208110556.6a3ed63a@free-electrons.com>
 <CAAXf6LWp4w+1J5MqYp6uOXWvXG3s0+V1qRt0p8jFM4pTv-qatg@mail.gmail.com>
 <dfb7a87b-6580-384d-81fb-e79f97e6b897@lucaceresoli.net>
Message-ID: <20170305092920.45b60f02@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 4 Mar 2017 19:12:44 +0100, Luca Ceresoli wrote:

> I'm no pythonist at all, so I don't know any of the mentioned
> infrastructures. But one thing I dislike in the current implementation
> is the unpleasant way failures are reported.

Are you talking about:

 * Failures because there is a syntax error in the test script

 * Failures of the test itself, because the generated Buildroot system
   doesn't behave as expected

To be honest, I don't think the unittest stuff is bringing us that much
stuff, so we could just as well roll our own "test runner", giving us
more freedom in our errors are handled and reported.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
