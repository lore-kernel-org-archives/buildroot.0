From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 16 Feb 2014 18:36:38 +0100
Subject: [Buildroot] [PATCH 0/10] Add dependency on kernel headers
In-Reply-To: <cover.1392571021.git.yann.morin.1998@free.fr>
References: <cover.1392571021.git.yann.morin.1998@free.fr>
Message-ID: <20140216173638.GA3417@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

On 2014-02-16 18:27 +0100, Yann E. MORIN spake thusly:
> This series introduces infrastructure for packages to depend on the
> required version of kernel headers.
> 
> It follows the proposal made on the list:
>     http://lists.busybox.net/pipermail/buildroot/2014-February/088924.html
> 
> The basic idea is to add a symbol for each kernel header version, and
> have toolchains select the appropriate symbol, and packages depend on the
> appropriate symbol.
> 
> In this series:
> 
>   - such symbols are added for all kernel headers >= 3.0;
> 
>   - the internal toochain backend selects the appropriate symbol
>     without user-visible changes;
> 
>   - the predefined external toolchains select the appropriate symbols
>     without user-visible changes; those using kernel headers older than
>     3.0, select nothing, and a comment is added to state so;
> 
>   - for the custom external toolchain, a new choice is shown to the
>     user, to select the appropriate kernel headers version;
> 
>   - five packages are converted to take advantage of this.

There is one thing this series does not do: ensure the selection is
correct, by way of a new 'check_headers_version' herlper in
toolchain/helpers.mk.

This can be added later, or in a second iteration of the series, if need
be.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
