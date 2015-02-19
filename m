From: Bryce Schober <bryce.schober@gmail.com>
Date: Thu, 19 Feb 2015 14:12:58 -0800
Subject: [Buildroot] How automate source download from a google drive?
In-Reply-To: <54E54294.3030702@ou.edu>
References: <54E54294.3030702@ou.edu>
Message-ID: <CAJpxd06ncFoxwLkeMyAuhPEXKNeH-Dh--Km=cvF0wN4e47xcVw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Feb 18, 2015 at 5:55 PM, Steve Kenton <skenton@ou.edu> wrote:

> This is a bit off the wall. I'm working with a package called tovid
> which you download from a google drive by clicking on a link on the wiki
> Darn if I can figure out how to put that into the .mk file to automate it.
> Look through packages directory and did not see anything obviously like it
>
> Any thoughts would be appreciated
>


This worked:
wget --no-check-certificate '
https://docs.google.com/uc?export=download&id=0B7aAfFRdwkUmeGZTT2pua0d1Z2c'
-O ~/Downloads/tovid.tar.gz

Based on this SO answer:
http://unix.stackexchange.com/a/148674/22389

You'll need to specify the full download name of the file because the wget
redirect apparently doesn't get it.

<><  <><  <><
Bryce Schober
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150219/d5aae0d6/attachment.html>
