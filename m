From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 9 Feb 2019 17:48:15 +0100
Subject: [Buildroot] [PATCHv2 7/8] support/download/scp: implement
 source-check
In-Reply-To: <20190204180553.18394-8-patrickdepinguin@gmail.com>
References: <20190204180553.18394-1-patrickdepinguin@gmail.com>
 <20190204180553.18394-8-patrickdepinguin@gmail.com>
Message-ID: <ed70ce0b-cce2-3267-40bd-83a25bb46b1b@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 04/02/2019 19:05, Thomas De Schampheleire wrote:
> +if [ -n "${checkonly}" ]; then
> +    # uri now looks like:  foo.example.org:some/directory
> +    domain="${uri%%:*}"
> +    path="${uri#*:}/${filename}"
> +    _ssh ${verbose} "${@}" "'${domain}'" ls "'${path}'" > /dev/null

 I don't know if it happens in practice, but it is possible to have scp access
to a machine but no 'ls' that you can run over ssh.

 Regards,
 Arnout

> +    exit ${?}
> +fi
