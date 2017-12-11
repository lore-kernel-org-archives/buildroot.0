From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 Dec 2017 20:14:35 +0100
Subject: [Buildroot] [PATCH 1/9] support/scripts/genimage.sh: show usage
 when invoked incorrectly
In-Reply-To: <1512855007-1834-2-git-send-email-luca@lucaceresoli.net> (Luca
 Ceresoli's message of "Sat, 9 Dec 2017 22:29:59 +0100")
References: <1512855007-1834-1-git-send-email-luca@lucaceresoli.net>
 <1512855007-1834-2-git-send-email-luca@lucaceresoli.net>
Message-ID: <87efo1vzz8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Luca" == Luca Ceresoli <luca@lucaceresoli.net> writes:

 > Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
 > ---
 >  support/scripts/genimage.sh | 6 +++++-
 >  1 file changed, 5 insertions(+), 1 deletion(-)

 > diff --git a/support/scripts/genimage.sh b/support/scripts/genimage.sh
 > index 625afc108c82..5ed9f9c1ae1e 100755
 > --- a/support/scripts/genimage.sh
 > +++ b/support/scripts/genimage.sh
 > @@ -1,7 +1,11 @@
 >  #!/usr/bin/env bash
 
 >  die() {
 > -  echo "Error: $@" >&2
 > +  cat <<EOF >&2
 > +Error: $@
 > +
 > +Usage: S{0} -c GENIMAGE_CONFIG_FILE

This should presumably have been ${0}?

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
