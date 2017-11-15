From: =?UTF-8?B?U3RlZmFuIEZyw7ZiZXJn?= <stefan.froberg@petroprogram.com>
Date: Wed, 15 Nov 2017 16:04:08 +0200
Subject: [Buildroot] Suggestion to improving buildroot download infra
Message-ID: <5A0C4958.9040608@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Is there a way to integrate parallel wget download into buildroot?

That would greatly speed the downloading process when doing "make source"
and maybe even later all the downloading could be done in the 
background, even
when compiling some big package (for example, gentoo linux does that).

If I understand it correctly, there are at least two (if not including 
the crude & fork method)
ways to do parallel wget:

1. use xarg:

echo $URL_LIST | xargs -n 1 -P ${NUMBER_OF_PARALLEL_DOWNLOADS} wget

or 2. use GNU parallel

parallel -a $URL_LIST --jobs ${NUMBER_OF_PARALLEL_DOWNLOADS} wget

How exactly, does buildroot collect the download urls when doing example,
"make source" ? Does it collect them first into some list and then do 
wget -i list ?
Or does it just go each selected packet one-by-one and fetch the url for 
each?

-S-
