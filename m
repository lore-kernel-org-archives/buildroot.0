From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 22 Sep 2014 21:38:21 +0200
Subject: [Buildroot] [PATCH 12/23 v5] docs/manual: last pass at removing
 hard-coded path in GENDOC_INNER
In-Reply-To: <661d747642ce1e9ca884829b0a295faf35933209.1410692670.git.yann.morin.1998@free.fr>
References: <cover.1410692670.git.yann.morin.1998@free.fr>
 <661d747642ce1e9ca884829b0a295faf35933209.1410692670.git.yann.morin.1998@free.fr>
Message-ID: <CAAXf6LUbrYHqCReJLRMRf4jfRGfH=0C=-TwYd2foZjpzzYonCw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Sep 14, 2014 at 1:07 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> GENDOC_INNER still has one hard-coded path to the document's directory:
> the asciidoc .conf files.

In this patch you assume that the asciidoc configuration is
document-specific, but at least the current contents of
asciidoc-text.conf are global IMO: they simply make sure that
hyperlinks are represented in a sane way, and that images are not
shown (text document only). These are settings that apply to all
documents.
It can be useful to provide a mechanism for other documents to pass
additional configuration files, but at this moment it is not strictly
needed. I don't know if it makes sense to already provide a variable
for that, or rather wait for a real use case to add it (KISS
principle).

Awaiting the outcome of this consideration, I did not yet review the
patch in detail.
