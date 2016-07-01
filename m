From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 1 Jul 2016 17:19:17 +0200
Subject: [Buildroot] [PATCH v2 4/4] gtest,
 gmock: Move download link away from Google Code
In-Reply-To: <1537894575.7432607.1467369780476.JavaMail.zimbra@datacom.ind.br>
References: <444859483-2268-1-git-send-email-alan@softiron.co.uk>
 <1456143807-3350-5-git-send-email-casantos@datacom.ind.br>
 <20160701094926.GA3659@free.fr>
 <1537894575.7432607.1467369780476.JavaMail.zimbra@datacom.ind.br>
Message-ID: <20160701151917.GB17666@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Carlos, All,

On 2016-07-01 07:43 -0300, Carlos Santos spake thusly:
> > On 2016-02-22 09:23 -0300, Carlos Santos spake thusly:
> >> Google Code is being shut down. The google code site which hosts the
> >> source .zip for gtest and gmock references github.com/google/googletest,
> >> now.
> >> 
> >> Change the GTEST_SITE and GMOCK_SITE to this new github repo, fix the
> >> version, fix the paths, and remove the custom extraction commands.
[--SNIP--]
> > As I understand it, gtest and gmock are being phased out as separate
> > packages, and are to be replaced with the googletest package.
> > 
> > So why don't we directly add "googletest" and get rid of gtest and
> > gmock, rather than fix them to eventually get rid of them?
> 
> Because we (DATACOM) have have a hundred packages in our BR2_EXTERNAL
> that depend on GMock and GTest as separate packages. It will take some
> time migrate them.

OK, but since gtest and gmock ar estill available from gcode, we can keep
them as-is for now, especially since changing their location require
that we get some invasive changes.

> > I've marked this patch as rejected in our patchwork now, while waiting
> > for the patches that add googletest and then removes gtest/gmock as
> > separate packages.
> 
> OK, I will keep it as a local change while working on the new package.

OK, thanks!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
