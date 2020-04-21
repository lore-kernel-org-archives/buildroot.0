From: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Date: Tue, 21 Apr 2020 15:00:12 -0500
Subject: [Buildroot] [PATCH 6/8] package/python3-pyyaml: add special
 host variant
In-Reply-To: <20200323104909.16765-6-yegorslists@googlemail.com>
References: <20200323104909.16765-1-yegorslists@googlemail.com>
 <20200323104909.16765-6-yegorslists@googlemail.com>
Message-ID: <CAMQcK5K=okZopvaBnQ7aKnSodBpaoOdgumTP3to0+-K_gzEdBw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yegor,

I've been working on testing that your patch series builds/works to
fix the issue with MongoDB not compiling with Buildroot 2020.02.
Please see my feedback in regards to your current patch set below:

On Mon, Mar 23, 2020 at 5:50 AM <yegorslists@googlemail.com> wrote:
>
> From: Yegor Yefremov <yegorslists@googlemail.com>
>
> Needed to build mongodb.
>
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  package/python3-pyyaml/python3-pyyaml.hash |  1 +
>  package/python3-pyyaml/python3-pyyaml.mk   | 20 ++++++++++++++++++++
>  2 files changed, 21 insertions(+)
>  create mode 120000 package/python3-pyyaml/python3-pyyaml.hash
>  create mode 100644 package/python3-pyyaml/python3-pyyaml.mk
>
> diff --git a/package/python3-pyyaml/python3-pyyaml.hash b/package/python3-pyyaml/python3-pyyaml.hash
> new file mode 120000
> index 0000000000..afa4932ecb
> --- /dev/null
> +++ b/package/python3-pyyaml/python3-pyyaml.hash
> @@ -0,0 +1 @@
> +../python-pyyaml/python-pyyaml.hash
> \ No newline at end of file
> diff --git a/package/python3-pyyaml/python3-pyyaml.mk b/package/python3-pyyaml/python3-pyyaml.mk
> new file mode 100644
> index 0000000000..3026135fca
> --- /dev/null
> +++ b/package/python3-pyyaml/python3-pyyaml.mk
> @@ -0,0 +1,20 @@
> +################################################################################
> +#
> +# python3-pyyaml
> +#
> +################################################################################
> +
> +# Please keep in sync with
> +# package/python-pyyaml/python-pyyaml.mk
> +PYTHON3_PYYAML_VERSION = 5.3

This currently does not work as python-pyyaml has been bumped to version 5.3.1.

https://patchwork.ozlabs.org/project/buildroot/patch/20200326100404.82191-1-james.hilliard1 at gmail.com/

Changing version to 5.3.1 fixes this.

Thanks,
-Ryan

---
Ryan Barnett | Sr Systems Engineer | Commercial Avionics
COLLINS AEROSPACE
400 Collins Rd NE, Cedar Rapids, IA 52498 USA
ryan.barnett at collins.com | collinsaerospace.com

CONFIDENTIALITY WARNING: This message may contain proprietary and/or
privileged information of Collins Aerospace and its affiliated
companies. If you are not the intended recipient, please 1) Do not
disclose, copy, distribute or use this message or its contents. 2)
Advise the sender by return email. 3) Delete all copies (including all
attachments) from your computer. Your cooperation is greatly
appreciated.
