From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 19 Oct 2016 22:10:07 +0200
Subject: [Buildroot] [PATCH] core/br2-external: export paths and
 descriptions
In-Reply-To: <20161019215857.7ee779d1@free-electrons.com>
References: <1476906782-30017-1-git-send-email-yann.morin.1998@free.fr>
 <20161019215857.7ee779d1@free-electrons.com>
Message-ID: <20161019201007.GB3898@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-10-19 21:58 +0200, Thomas Petazzoni spake thusly:
> On Wed, 19 Oct 2016 21:53:02 +0200, Yann E. MORIN wrote:
> > Now that we support multiple br2-external trees, BR2_EXTERNAL is no
> > longer exported in the environment.
> > 
> > This means that post-build scripts in a br2-external tree can no longer
> > find their own files (well, they could re-invent the path by stripping
> > their known-relative path, but that'd be ugly, especially since we can
> > very well provide it).
> > 
> > Export the path for each br2-external trees as environment variables.
> > Do so for the description as well, as a courtesy.
> > 
> > Also, re-order variable definitions to be more logical: first, purely
> > internal variables, then exported variables.
> > 
> > Reported-by: Beno?t Allard <benoit.allard@greenbone.net>
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Beno?t Allard <benoit.allard@greenbone.net>
> 
> Does this require some documentation update?

I would have guessed no. We already state in the manual that the variable
to use is BR2_EXTERNAL_<NAME>_PATH.

However, _DESC is not documented. So I'll ad a blurb that those two
variables are also available to post-build scripts.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
