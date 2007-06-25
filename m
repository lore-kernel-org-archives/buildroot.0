From: Ulf Samuelsson <ulf@atmel.com>
Date: Mon, 25 Jun 2007 16:42:12 +0200
Subject: [Buildroot] Can "make <>_defconfig" rules be restored?
In-Reply-To: <20070625134008.GA7287@aon.at>
References: <01c301c7b519$52679b40$6e02a8c0@k2>
	<20070623093927.GG4096@aon.at> <003801c7b605$0e32cb10$6604a8c0@shukson>
	<1182776909.20950.4.camel@aeglos.sweden.atmel.com>
	<1182777605.10703.37.camel@localhost.localdomain>
	<20070625134008.GA7287@aon.at>
Message-ID: <1182782532.22583.21.camel@aeglos.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> >> It is not particularily efficient to search the whole tree for config files.
> 
> That whole quirk is not efficient, that's why i don't use it but have my
> configs separarately and do a simple
> 'make reconfigure CONFIG_DEFCONFIG=/my/foo-config'
> 
> As long as you folks don't slow down my testsuite like that (")??=% find
> invocation did, i'm happy. That %_defconfig thing is something that i do
> not want (and do not want to understand either), and as it doesn't hurt
> me and complicates maintenance (which it doesn't from my POV), then it's
> fine to apply.
>
> I'm attaching the hunk that i am using to do something like you guy seem
> to be up to (or perhaps not, dunno) for your amusement. No find, no ugly
> separate dirs that reside in svn, nothing disturbing, just simply does
> what it's supposed to do, and doesn't add any bloat or creeping
> featureitis. I'll shut up for now.

Similar to my stuff.
The reason I use a separate directory, is that I do not want to specify
where the config file is located inside the command to configure.

"make reconfigure
CONFIG_DEFCONFIG=/home/ulf/projects/Buildroot/20070531/buildroot-atmel/configs/at91sam9263-2007-06-25.config"

is just a little more typing than I like.


I prefer the <board>_defconfig syntax, since this is easier
to remember than and there is therefore less likelyhood that errors
occur, I.E: less support calls.

Also the stuff does not easily lend it to updating the config file.
I can save the configuration in a new file, and this is a nice feature
I really like to have.


-- 
Best Regards,
Ulf Samuelsson
