From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 10 Jun 2018 17:07:59 +0200
Subject: [Buildroot] [PATCH] docs/manual: document filesystems
In-Reply-To: <1789748625.2040845.1528637888756.JavaMail.zimbra@datacom.com.br>
References: <20180609094647.21460-1-yann.morin.1998@free.fr>
 <1806912659.2037633.1528582803656.JavaMail.zimbra@datacom.com.br>
 <20180610081217.GB2471@scaer>
 <1789748625.2040845.1528637888756.JavaMail.zimbra@datacom.com.br>
Message-ID: <20180610150759.GE2471@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Carlos, All,

On 2018-06-10 10:38 -0300, Carlos Santos spake thusly:
> > From: "Yann Morin" <yann.morin.1998@free.fr>
> >> Genarating filesystem images do not modify the
> >> contents of the global $(TARGET_DIR) and user-provided rootfs extensions
> >> must not do this.
[--SNIP--]
> > Why do you insist on modifying the global target/ directory from your
> > filesystem? If you do that, and build two or more filesystems [*], they
> > might each try to modify target/ is incompatible ways, and this is not
> > even safe, concurrency-wise (e.g. ony may try to archive the content of
> > /var while another is doing a rm -rf on it.)
> 
> I never intended to modify the global $(TARGET_DIR).

Sorry, I mis-interpreted your comment above, as "user-provided rootfs []
must not do this" to which I appended in my head "but that is exactly
what I want to do in my case."

I'm sorry, I should be more careful in my interpretations in the future.

So, I'll take that as a hint to further improve the section that
explains how filesystems are generated, to more carefully describe and
explain the sequence.

Thanks again for the feedback! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
