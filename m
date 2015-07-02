From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Jul 2015 12:04:02 +0200
Subject: [Buildroot] [PATCH 2/2] openssl: always build apps
In-Reply-To: <55950B29.9090200@wsystem.com>
References: <1434711274-49716-1-git-send-email-benoit@wsystem.com>
 <1434711274-49716-2-git-send-email-benoit@wsystem.com>
 <20150701111411.1dab82cc@free-electrons.com>
 <55950B29.9090200@wsystem.com>
Message-ID: <20150702120402.4e4e3b9d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Beno?t Th?baudeau,

On Thu, 2 Jul 2015 11:58:01 +0200, Beno?t Th?baudeau wrote:

> Yes. My intent was to keep the rules minimal, but I agree that it is better as
> you suggest. I will send a v2.

Great, thanks.

> I have a question about the management of the scripts depending on Perl, though.
> Doing as you suggest hides this behavior in the .mk, so the users won't know
> that they have a choice just by looking at the configuration. Do you think that
> it does not really matter, or that a comment or a depends on / select should be
> added to the Config.in?

We generally try to not clutter menuconfig with too many
comments/options: we can't make visible in menuconfig every little
possible dependency. That's why we use a lot of "automatic optional
dependencies": a package automatically uses another package if it is
available, without having this dependency visible from a
menuconfig/Config.in point of view.

I think it's a bit the same here. If you know you need that specific
Perl script from OpenSSL, then we assume that you are smart enough to
realize that you might need to enable a Perl interpreter for your
target.

Yes: we do believe our users are smart! :-)

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
