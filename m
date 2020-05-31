From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 31 May 2020 23:14:36 +0200
Subject: [Buildroot] [PATCH] packages/systemd: fix double getty on
 console
In-Reply-To: <20200522165929.682891-1-jeremy.rosen@smile.fr>
 (=?utf-8?B?IkrDqXLDqW15?= Rosen"'s
 message of "Fri, 22 May 2020 18:59:29 +0200")
References: <20200522165929.682891-1-jeremy.rosen@smile.fr>
Message-ID: <87a71nkds3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?r?my" == J?r?my Rosen <jeremy.rosen@smile.fr> writes:

 > When selecting "console" for the automatic getty, the buildroot logic
 > would collide with systemd's internal console detection logic, resulting
 > in two getty being started on the console.

 > This commit fixes that by doing nothing when "console" is selected and
 > letting systemd-getty-generator deal with starting the proper getty.

 > Note that if something other than the console is selected
 > * Things will work properly, even if the selected terminal is also the
 >   console
 > * A getty will still be started on the console.
 >   This is what systemd has been doing on buildroot since the beginning. it
 >   could be disabled but I left it for backward compatibility

 > Fixes: #12361
 > Signed-off-by: J?r?my Rosen <jeremy.rosen@smile.fr>

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
