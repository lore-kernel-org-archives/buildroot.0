From: Julien Floret <julien.floret@6wind.com>
Date: Thu, 17 Dec 2020 09:22:06 +0100
Subject: [Buildroot] pycompile script doesn't compile files with single
 character names
In-Reply-To: <CAAV4SYZLndA0mHnZO6+9+YGaVKtPQwGYHxWi4=ckF67AzibDzw@mail.gmail.com>
References: <CAAV4SYZLndA0mHnZO6+9+YGaVKtPQwGYHxWi4=ckF67AzibDzw@mail.gmail.com>
Message-ID: <CAHfJR7j8YdVLnYyXu7imzcnTC_9AcEnBwBi1BFFJTtqRNxXKGg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Charles,

Le mer. 16 d?c. 2020 ? 14:37, Charles Eidsness via buildroot
<buildroot@busybox.net> a ?crit :
>
> Hi All,
>
> I'm not sure if this is by design but the pycompile utility won't compile single character python files. This causes an issue if you've selected pyc files only and are building python-dnspython, which has some single character filenames.
>
> Here is a simple fix:
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
>      ):
>          return  # only compile "importable" python modules
>

Your fix looks good to me. Could you send a git patch using "git
send-email", so that it can be applied by the maintainers?
Thanks!

Julien
