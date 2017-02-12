From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 12 Feb 2017 18:28:24 +0100
Subject: [Buildroot] [PATCH v2] infra/ccache: avoid color diagnostics
 with GCC older than v4.9
In-Reply-To: <20170212182246.0b40c952@free-electrons.com>
References: <1486733648-14658-1-git-send-email-casantos@datacom.ind.br>
 <1486899181-8210-1-git-send-email-casantos@datacom.ind.br>
 <20170212141425.GE11105@free.fr>
 <609383214.9983962.1486911337173.JavaMail.zimbra@datacom.ind.br>
 <20170212182246.0b40c952@free-electrons.com>
Message-ID: <20170212172824.GH11105@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2017-02-12 18:22 +0100, Thomas Petazzoni spake thusly:
> Hello,
> 
> On Sun, 12 Feb 2017 12:55:37 -0200 (BRST), Carlos Santos wrote:
> 
> > > Can you provide a reliable way to reproduce the issue, please?  
> > 
> > What does "echo $GCC_COLORS" say?
> 
> thomas at skate:~$ echo $GCC_COLORS
> 
> thomas at skate:~$
> 
> So the issue only arise when GCC_COLORS is defined non-empty in the
> user's environment?

Well, from the point of view of ccache, any value whould have triggered
the issue, because ccache only ever checks if the variables exists in
the environment.

But see my other reply: even with a valid value, I could not trigger the
bug either...

> > And remember that you must not redirect the output to a file or pipe.
> I just ran "make" without redirecting the output to a file or pipe.

Same as I did.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
