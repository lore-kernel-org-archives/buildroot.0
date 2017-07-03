From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Mon, 03 Jul 2017 11:09:18 +0200
Subject: [Buildroot] [PATCH v2 1/1] automake: fix unescaped left brace
 warning patch.
In-Reply-To: <20170320214543.02c3461c@free-electrons.com>
References: <20170306132359.21768-1-aduskett@codeblue.com>
 <20170320214543.02c3461c@free-electrons.com>
Message-ID: <1499072958.1626.5.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 2017-03-20 at 21:45 +0100, Thomas Petazzoni wrote:
> Hello,
> 
> On Mon,  6 Mar 2017 08:23:59 -0500, Adam Duskett wrote:
> > Automake currently has a unescaped left brace in it's automake.in
> > folder
> > that generates the warning:
> > "Unescaped left brace in regex is deprecated, passed through in
> > regex;"
> > This patch, which is backported from upstream fixes this warning.
> > 
> > Signed-off-by: Adam Duskett <aduskett@codeblue.com>
> 
> I've applied. However, you should format the patches of projects
> managed with Git using "git format-patch". So the automake patch
> should
> have been Git formatted. I've fixed that before applying.

We should apply the patch to the 2017.02.x branch, too. Perl 5.26 is
treating the warning as an error. This patch fixes building alsa-lib
for me on the 2017.02.x branch.

J?rg
