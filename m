From: Carlos Santos <casantos@datacom.ind.br>
Date: Fri, 20 Jan 2017 08:24:03 -0200 (BRST)
Subject: [Buildroot] [PATCH v2] util-linux: fix ncurses/wchar handling
 (again)
In-Reply-To: <52160250.7827358.1484854130829.JavaMail.zimbra@datacom.ind.br>
References: <1484281849-25875-1-git-send-email-casantos@datacom.ind.br>
 <1484301833-16403-1-git-send-email-casantos@datacom.ind.br>
 <20170117164437.36272eed@free-electrons.com>
 <cc558229-46cf-ebf9-7df1-280cf8c7e18e@cartelsol.com>
 <52160250.7827358.1484854130829.JavaMail.zimbra@datacom.ind.br>
Message-ID: <1101067464.7863096.1484907843988.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Carlos Santos" <casantos@datacom.ind.br>
> To: "Hoffmann, Marcus" <m.hoffmann@cartelsol.com>, "Petazzoni, Thomas" <thomas.petazzoni@free-electrons.com>
> Cc: buildroot at busybox.net
> Sent: Thursday, January 19, 2017 5:28:50 PM
> Subject: Re: [Buildroot] [PATCH v2] util-linux: fix ncurses/wchar handling (again)

>> From: "Marcus Hoffmann" <m.hoffmann@cartelsol.com>
>> To: buildroot at busybox.net
>> Sent: Tuesday, January 17, 2017 11:57:12 AM
>> Subject: Re: [Buildroot] [PATCH v2] util-linux: fix ncurses/wchar handling
>> (again)
> 
>> On 17.01.2017 06:44, Thomas Petazzoni wrote:
[...]
>>> So if we are going to merge a different solution, I'd like to see an
>>> investigation of whether commit
>>> 5a18eabdf08564688761a9b2f35892d69d8f9a18 is still needed or not. If
>>> it's not, then it should be reverted as well.
> 
> It can be reverted. I just confirmed that my patch covers both the
> musl and uClibc cases.
> 
>>> I must say I find the fix of playing with the ordering of includes to
>>> be somewhat hackish. Do we have a better solution? Is it really legal
>>> for util-linux to redefine wchar_t? Should it use a better autoconf
>>> check before doing this?
>> 
>> Maybe we should ask the util-linux list? There's often an active
>> discussion, on what is the correct way to handle such things.
>> 
>> Marcus
> 
> I just sent a patch to the util-linux list.

Good news! My patch was accepted and applied upstream:

    http://git.kernel.org/cgit/utils/util-linux/util-linux.git/commit/?id=9ea8ded37b648bbd538cbf9c4d144b8b1a93c1b5

Carlos Santos (Casantos) - DATACOM, P&D
?Something must be done. This is something. Therefore we must do it.?
(from the BBC series ?Yes, Prime Minister?, ?Power to the people?)
