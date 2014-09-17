From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 17 Sep 2014 15:15:52 +0200
Subject: [Buildroot] [PATCH 3/6] python-rtslib-fb: new package
In-Reply-To: <20140917151302.08303544@grp-cvubrugier>
References: <1410953999-16520-1-git-send-email-cvubrugier@fastmail.fm>
 <1410953999-16520-4-git-send-email-cvubrugier@fastmail.fm>
 <20140917140059.0eee9af9@free-electrons.com>
 <20140917151302.08303544@grp-cvubrugier>
Message-ID: <20140917151552.6d0d0e91@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Christophe Vu-Brugier,

On Wed, 17 Sep 2014 15:13:02 +0200, Christophe Vu-Brugier wrote:

> Thank you for the prompt review.

You're welcome. Thanks for submitting those packages in the first place!


> > Is it for this package that you had the Python 3 issue? Could you
> > explain a bit more the 2to3 problems you have seen?
> 
> It is for this package (and for configshell-fb and targetcli-fb) that I
> thought I had an issue with `2to3`.
> But I was wrong because it seems that `2to3` is correctly invoked by
> setup.py when it is run under Python 3.
> The installed python files are different from the source python files
> and are modified by `2to3`:
> 
> --- build/python-rtslib-fb-v2.1.fb49/rtslib/utils.py
> +++ target/usr/lib/python3.4/site-packages/rtslib/utils.py
> @@ -435,14 +435,14 @@
>              raise
>  
>  def set_attributes(obj, attr_dict, err_func):
> -    for name, value in attr_dict.iteritems():
> +    for name, value in attr_dict.items():
> 
> So if there is an issue, it is not caused by a broken `2to3`.

Indeed, this modification looks like a Python 2 vs. Python 3
conversion, even though I'm not familiar enough with the Python
language changes to be sure.

What was the issue you had with Python 3 ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
