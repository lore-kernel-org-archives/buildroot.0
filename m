From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 21 Mar 2018 22:44:36 +0100
Subject: [Buildroot] Unicode problem with check-uniq-files
In-Reply-To: <86fb507f-1fa7-8355-6ec6-7b346e6945e7@jcz.nl>
References: <3a25e768-759e-e377-fcae-48c8e3e36ddd@jcz.nl>
 <20180319213240.GA340@scaer>
 <86fb507f-1fa7-8355-6ec6-7b346e6945e7@jcz.nl>
Message-ID: <20180321214436.GA2085@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jaap, All,

On 2018-03-20 08:48 +0100, Jaap Crezee spake thusly:
> 
> On 03/19/18 22:32, Yann E. MORIN wrote:
> >Could you please attach this packages-file-list.txt please?
> Here you go.

OK, thanks, I'll have a look now...

> I think it is related to output from ca-certificates. This package installs
> some files with non ascii chars in the certificate filenames. The strange
> part is that I have done this for a long time and do not really understand
> why it is failing now.

If you change your LC_ALL et al to an UTF-8 locale, it will work again,
I believe.

> And shouldn't this script use host-python instead of the python which is
> present on the host? Could be a PATH related issue in the execution
> environment for this script?

No, because we don't always have a host-python that is built. Besides,
python is a requirement for Buildroot, see the manual:
    https://buildroot.org/downloads/manual/manual.html#requirement-mandatory

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
