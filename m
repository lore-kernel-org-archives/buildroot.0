From: Patrick <pf@stollmann.de>
Date: Tue, 02 Sep 2008 16:08:18 +0200
Subject: [Buildroot] Script Preprocessor
Message-ID: <20080902140742.29048.qmail@bux.stollmann.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello
Currently im thinking about a way to handel our init scripts.


In some Scripts we have some ugly code like

##########
fw_printenv device >/tmp/device
. /tmp/device

if [ "$device" = "X" ]
then
echo This is device X
fi

if [ "$device" = "X" -o "$device" = "Y"]
then
echo This is device X or Y
fi
##########

This is not the way it should be.
This could be resolved on build time.
Did anybody know a solution?

I could write a Script which could preprocess a file like this. A line 
begins with"#X" meens if [ "$device" = "X" ] then ..... fi

##########
fw_printenv device >/tmp/device
. /tmp/device

#X echo This is device X
#X||Y echo This is device X or Y
##########

Maybe there is already a solution?

Best regards
Patrick Fischer
