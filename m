From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Fri, 12 Dec 2008 11:14:50 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/samba
In-Reply-To: <87iqppr9lp.fsf@macbook.be.48ers.dk>
References: <20081212092938.291973C2E4@busybox.net>
	<87iqppr9lp.fsf@macbook.be.48ers.dk>
Message-ID: <20081212111450.7af4120c@hcegtvedt>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 12 Dec 2008 11:06:26 +0100
Peter Korsgaard <jacmet@uclibc.org> wrote:

> >>>>> "egtvedt" == egtvedt  <egtvedt@uclibc.org> writes:

<snipp>

>  egtvedt>  $(SAMBA_DIR)/$(SAMBA_BINARY): $(SAMBA_DIR)/.configured
>  egtvedt> -	$(MAKE1) -C $(SAMBA_DIR)
>  egtvedt> +	$(MAKE) -C $(SAMBA_DIR) proto
> 
> Shouldn't this then be $(MAKE1) ?
> 

Not needed, it is safe to parallel build the proto stuff. The problem
is that the all: rule does not depend properly on proto.

-- 
Best regards,
Hans-Christian Egtvedt
