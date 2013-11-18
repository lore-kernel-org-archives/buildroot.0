From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 Nov 2013 00:32:45 +0100
Subject: [Buildroot] [PATCH 1/1] dbus-python: select pyexpat dependency
In-Reply-To: <CAPyrzo1JdOBrWPbDR3-B5CJXQi0O5nGoK_HQOQv6rWNYAMhJqg@mail.gmail.com>
References: <1384814104-11809-1-git-send-email-vsergeev@kumunetworks.com>
 <CAPyrzo1JdOBrWPbDR3-B5CJXQi0O5nGoK_HQOQv6rWNYAMhJqg@mail.gmail.com>
Message-ID: <20131119003245.29a4eb69@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ivan Sergeev,

On Mon, 18 Nov 2013 14:37:59 -0800, Ivan Sergeev wrote:

> For some reason git send-email didn't attach the patch. I've attached it
> here.

git send-email never "attaches" the patch. It sends the patch inline,
so that reviewers can hit "reply" and review your patch directly by
replying to the e-mail.

I think your patch is good, but you should add a comment above the new
select line to indicate that it is a runtime dependency only (which
explains why you're changing the Config.in only, and not the .mk file).
Something like:

	# Runtime dependency only
	select BR2_PACKAGE...

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
