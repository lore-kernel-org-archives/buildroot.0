From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 4 Mar 2012 11:57:15 +0100
Subject: [Buildroot] Kconfig: "selects" vs. "depends on"
In-Reply-To: <CAHXCMMKQjy0Z1Ozn0wu4r14_XQQMWyZTpq3B9kkzJNpj-iUgcw@mail.gmail.com>
References: <20120304071855.3e6c03b5@gmail.com>
 <CAHXCMMKQjy0Z1Ozn0wu4r14_XQQMWyZTpq3B9kkzJNpj-iUgcw@mail.gmail.com>
Message-ID: <201203041157.15326.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sunday 04 March 2012 11:11:58 Samuel Martin wrote:
> 2012/3/4 Ismael Luceno <ismael.luceno@gmail.com>:
> > Which should I use?
> Afaik, "depends on" is transitive, whereas "select" is not, see [1] as ref.

 Actually, no.  Both of them are transitive, but only with themselves.  So
a depends-on chain works, and a select chain works, but a mix of depends-on
and select doesn't.  Bottom line is: if you use select, you should copy the
depends-on statements of the symbol you select.  Which is one reason why I 
claim we should use select as much as possible (to avoid mixing them).


 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
