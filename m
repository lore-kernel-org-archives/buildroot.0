From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 28 Dec 2017 22:36:29 +0100
Subject: [Buildroot] [PATCH v9 0/8] Add support for the Rust programming
In-Reply-To: <20171228175256.GA24806@ned>
References: <20171228155146.18193-1-eric.le.bihan.dev@free.fr>
 <20171228172129.3dd0acdc@windsurf.home>
 <20171228175256.GA24806@ned>
Message-ID: <20171228223629.0fd45695@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 28 Dec 2017 18:52:56 +0100, Eric Le Bihan wrote:

> Yes, this is correct. The introduction of a virtual package for the Rust
> compiler was suggested in the mail thread about version v4 of this
> series [1], as building the compiler from source takes time and using the
> available pre-built version would speed things up (as done for GCC).

OK, thanks for the additional explanation, makes sense.

I reviewed the different patches in your series, and I think it's
really close to a state where it can be merged. If you can take care of
the few comments/questions in the near future, it would definitely
help, as I would still have the context in mind.

Two other things that would be nice to do is:

 - Add two test cases in support/testing/. One that builds a system with
   rust-bin, builds a hello world program in Rust, and run it on the
   target. And another that does the same, but by building the rust
   compiler from source. Perhaps additional test cases can be added for
   Cargo, but I'm not sure how it's supposed to be used.

 - Add a short section in the documentation that explains how the Rust
   support in Buildroot is working. This would help people trying to do
   stuff with Rust to understand how things work.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
