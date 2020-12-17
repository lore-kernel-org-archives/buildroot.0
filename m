From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 17 Dec 2020 22:45:27 +0100
Subject: [Buildroot] [PATCH] fix the single character python file bug
In-Reply-To: <CAAV4SYY66WVh1=-h3v7doZcYiFnCMCZ9ath0MaZiEdbp2LBeXA@mail.gmail.com>
References: <CAAV4SYY66WVh1=-h3v7doZcYiFnCMCZ9ath0MaZiEdbp2LBeXA@mail.gmail.com>
Message-ID: <20201217214527.GE3188@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Charles, All,

Thanks for this quick followup.

The commit log should be formatted with a prefix that defines what is
touched and a brief description of the change. Then the body of the
commit log should contain a more detailed explanation. Eventually, we
will need that you sign-off your change.

For example:

    support/pycompile: support scripts with a single-charater filename

    We can only pre-compile files that can be imported; the regexp that
    filters filenames rejects filenames that contains a single
    character, although this is perfectly valid.

    Fix the regexp to accept those filenames.

    Signed-off-by: Your REAL-NAME <your-email@adress>

See: https://buildroot.org/downloads/manual/manual.html#submitting-patches

However, I have a question about your change, see below...

On 2020-12-17 06:56 -0500, Charles Eidsness via buildroot spake thusly:
> ---
>  support/scripts/pycompile.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/support/scripts/pycompile.py b/support/scripts/pycompile.py
> index 7041a0506b..e2cfc2683c 100644
> --- a/support/scripts/pycompile.py
> +++ b/support/scripts/pycompile.py
> @@ -30,7 +30,7 @@ def compile_one(host_path, strip_root=None, verbose=False):
>          return  # only compile real files
> 
>      if not re.match(
> -            r"^[_A-Za-z][_A-Za-z0-9]+\.py$", os.path.basename(host_path)
> +            r"^[_A-Za-z][_A-Za-z0-9]*\.py$", os.path.basename(host_path)

The current code in buildroot master looks like:

    if not re.match(r"^[_A-Za-z][_A-Za-z0-9]+\.py$",
                    os.path.basename(host_path)):

So your patch does not apply. What tree did you base your change on?

Otherwise, the change looks semantically perfectly correct.

Can you fix the above and resend a fixed patch, please?

Regards,
Yann E. MORIN.

>      ):
>          return  # only compile "importable" python modules
> 
> -- 
> 2.29.2
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
