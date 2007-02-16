From: Philippe Ney <philippe.ney@pardes.ws>
Date: Fri, 16 Feb 2007 08:15:45 +0100
Subject: [Buildroot] changing the mk file in a package
In-Reply-To: <20070215192046.HM.00000000000000h@daniel_ng11.bos-mail-wwl24.lycos.com>
References: <20070215192046.HM.00000000000000h@daniel_ng11.bos-mail-wwl24.lycos.com>
Message-ID: <20070216081545.cb73d4b9.philippe.ney@pardes.ws>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Hi,
> 
> I'm adding a new package to buildroot. Following the standard docco I add a new
[...]
> If I do a full rebuild, I don't get the above problem. But the fully rebuild
> takes about 30 minutes! Is there a way to get a more sensible 'make' behaviour,
> so that I can avoid having to do these full rebuilds?

Hi,

Sure, juste make your target.
Say your new package as a target like

newpkg:
	$(MAKE) -C $(NEWPKG_SRC)

Then, just run :

$ make newpkg

If your package doesn't depend on cramfs, you normally shouldn't have the
problem you pointed.

Philippe
