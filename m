From: Henrique Marks <henrique.marks@datacom.ind.br>
Date: Thu, 5 Oct 2017 08:36:57 -0300 (BRT)
Subject: [Buildroot] [PATCH] Create 'make <pkt>-show-rrdepends' command
In-Reply-To: <63a3e218-f37c-649b-fc48-0e9c0a892a10@mind.be>
References: <1493305458-15309-1-git-send-email-george.redivo@datacom.ind.br>
 <1507033962-5566-1-git-send-email-casantos@datacom.ind.br>
 <63a3e218-f37c-649b-fc48-0e9c0a892a10@mind.be>
Message-ID: <909405437.12454753.1507203417835.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all

----- Mensagem original -----
> De: "Arnout Vandecappelle" <arnout@mind.be>
> Para: "Carlos Santos" <casantos@datacom.ind.br>, buildroot at buildroot.org
> Cc: "George Redivo" <george.redivo@datacom.ind.br>
> Enviadas: Quarta-feira, 4 de outubro de 2017 13:18:32
> Assunto: Re: [Buildroot] [PATCH] Create 'make <pkt>-show-rrdepends' command

> On 03-10-17 14:32, Carlos Santos wrote:
>> From: George Redivo <george.redivo@datacom.ind.br>
>> 
>> Hello,
>> 
>> Looks like this https://patchwork.ozlabs.org/patch/756075/ was accepted by
>> Arnout but was left behind. Could we have it applied, please?
> 
> I didn't exactly "accept" this patch. I thought the implementation was
> acceptable, but I wasn't entirely sure the use case was important enough to
> warrant the additional complexity.
> 
> If I understand the use case correctly, what you want is that you have changed
> something in package A, so you want to rebuild package A and all its recursive
> dependencies. For that, a recursive dirclean is probably more appropriate:
> 
> $(1)-dirclean-recursive: $(1)-dirclean $$(patsubst
> %,%-dirclean-recursive,$$($(2)_FINAL_ALL_DEPENDENCIES))
> 

Not exactly the same i guess, i think this will rebuild package A and all its dependencies (we are going "down" on dependencies).

The point of this script is to rebuild package A and all those who depends on it (we are going "up" on dependencies).

Based on previous work done on the reverse-dependencies (make <pkg>-show-rdepends), this has been turned in recursive-reverse-dependencies.

-- 
Dr. Henrique Marks
henrique.marks at datacom.ind.br
R. Am?rica, 1000 - Eldorado do Sul - RS
CEP: 92990-000 - Brasil
Fone: +55 51 3933 3000 - Ramal 3466
