From: Romain Naour <romain.naour@openwide.fr>
Date: Mon, 28 Oct 2013 00:16:45 +0100
Subject: [Buildroot] [PATCH v3 1/1] trace-cmd: use pkg-config instead of
	python-config
In-Reply-To: <871u37uezx.fsf@dell.be.48ers.dk>
References: <52644CCE.1040307@openwide.fr> <871u37uezx.fsf@dell.be.48ers.dk>
Message-ID: <526D9EDD.3070104@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 27/10/2013 12:31, Peter Korsgaard a ?crit :
>>>>>> "Romain" == Romain Naour <romain.naour@openwide.fr> writes:
>   > trace-cmd use python-config to find out which headers
>   > and libraries should be used to link against the Python libraries.
>   > By default, python-config returns paths that are inappropriate for
>   > cross-compilation.
>
>   > This patch replaces python-config with pkg-config as a workaround.
>
>   > Add PYTHON_VERS to build trace-cmd with python2 or python3
>
>   > Fixes:
>   > http://autobuild.buildroot.net/results/980/980875810528ac1dee34b8c268d9b3c40b2e35ec/
>
> Committed, thanks. Did you send the patch upstream? If not, please try
> to do so?
>
Hi,

Not yet, but it would be better to fix python-config directly instead of 
replacing it.
The RFC about the new pkg-python infrastructure is interesting.
If I understand correctly it may also fixes this issue without replacing 
python-config.

I will still send this patch upstream.

We have a new issue with trace-cmd if ptrace support is not available...
A new patch is coming for review :)

Best regards,
Romain
