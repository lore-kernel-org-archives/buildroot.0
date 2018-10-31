From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 31 Oct 2018 11:21:09 +0100
Subject: [Buildroot] [git commit] lighttpd: adjust Config.in to make
 check-package happy
In-Reply-To: <20181031095117.912A283807@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Wed, 31 Oct 2018 10:52:14 +0100")
References: <20181031095117.912A283807@busybox.osuosl.org>
Message-ID: <874ld2ct7u.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=71f4f97d0aebe36c6399822840fe5301a5339b10
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Commit b9d75c717e01aed474b7567c969236418e87eda8 ("lighttpd: add
 > optional pam support") introduced a new Config.in option, but
 > check-package was not happy about it:

 > package/lighttpd/Config.in:30: should be indented with one tab (http://nightly.buildroot.org/#_config_files)
 > package/lighttpd/Config.in:31: should be indented with one tab (http://nightly.buildroot.org/#_config_files)
 > package/lighttpd/Config.in:32: attributes order: type, default, depends on, select, help (http://nightly.buildroot.org/#_config_files)
 > package/lighttpd/Config.in:32: should be indented with one tab (http://nightly.buildroot.org/#_config_files)
 > package/lighttpd/Config.in:33: should be indented with one tab (http://nightly.buildroot.org/#_config_files)
 > package/lighttpd/Config.in:34: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)

 > This commit fixes those indentation and ordering issues.

Ups, wonder how that happened. I'll have a look at executing
check-package in a git pre-commit hook.

-- 
Bye, Peter Korsgaard
