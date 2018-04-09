From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 9 Apr 2018 23:56:33 +0200
Subject: [Buildroot] [PATCH] download/git: more resilient in case of kill
In-Reply-To: <20180409234524.4144b90b@windsurf>
References: <20180409214155.24741-1-yann.morin.1998@free.fr>
 <20180409234524.4144b90b@windsurf>
Message-ID: <20180409215633.GC2312@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2018-04-09 23:45 +0200, Thomas Petazzoni spake thusly:
> Hello,
> 
> On Mon,  9 Apr 2018 23:41:55 +0200, Yann E. MORIN wrote:
> 
> > +pushd "${git_cache}" >/dev/null
> 
> So you're doing the pushd here now.
> 
> > +
> > +# Ensure the repo has an origin (in case a previous run was killed).
> > +if git remote |grep -q -E '^origin$'
> >      pushd "${git_cache}" >/dev/null
> 
> And therefore I'm not sure why it's needed here...
> 
> >      _git remote add origin "'${uri}'"
> >      popd >/dev/null
> 
> ... and this popd would no longer be needed.
> 
> >  fi
> >  
> > -pushd "${git_cache}" >/dev/null
> 
> I am missing something?

Absolutely nothing.

I will respin.

Thanks.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
