From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 18 Aug 2019 23:28:35 -0300
Subject: [Buildroot] [PATCH 1/9] support/graph-size: fix flake8 warnings
References: <831c11fcb0c77b1d1d0692469a66d664ca9d65a4.1566062299.git.yann.morin.1998@free.fr>
Message-ID: <5d5a095335eb3_20563fa18c16b2d8973b8@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, Aug 17, 2019 at 02:18 PM, Yann E. MORIN wrote:

> There are three E501 warnings returned by flake8, when run locally,
> because we enforce a local 80-char limit, but that are not reported by
> the gitlab-ci jobs because only a 132-char limit is required there.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Reviewed-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>

> ---
> I initially whined loudly when this discrepancy was added, but now I
> can prove that it is bad: running flake8 on a locally-modified script
> will return errors that have not been introduced by the developer, but
> by a previous change by someone else that was not careful to run flake8
> on it... Sigh... :-(

I see your point. Some warnings that show only locally can be missed during a
code-review and are not caught by the gitlab-ci job.

But I think the rule is not the one to blame here, for this file.
You can blame me for missing those lines :-(

Those lines were added when the script was added in commit [1] by Thomas P.
Later I tried to add the config to match the 80/132 rule but I failed [2].
Then, in order to have flake8 in gitlab-ci [4], I tried to remove the existing
warnings [3] but the list of warnings I used was based on [2] so it was
incomplete for E501.
And finally the config to match the 80/132 was fixed by [5].

[1] 2015 598c80be8f support/scripts: add size-stats script
[2] 2017 918a02ce22 .flake8: add config file for Python code style
[3] 2018 493a86a7b7 size-stats: fix code style
[4] 2018 1960eda2f6 .gitlab-ci.yml: check flake8
[5] 2019 7d17ae2acf .flake8: fix check for 80/132 columns

Regards,
Ricardo
