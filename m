From: Jan Pohanka <xhpohanka@gmail.com>
Date: Thu, 31 Oct 2013 21:23:35 +0100
Subject: [Buildroot] iconv: additional encodings
In-Reply-To: <52725222.9050503@gmail.com>
References: <52725222.9050503@gmail.com>
Message-ID: <CABMiYf_=RK0UJyZLNkW5JU3xSXKMcNxL9-VRxjNpFqtZ3ye50g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I will answer myself: GCONV_PATH variable is the solution. It must
point into /usr/lib/gconv!

2013/10/31 Jan Pohanka <xhpohanka@gmail.com>:
> Hi all,
>
> I'm using buildroot for creating a filesystem on armhf target. Target is
> selected as external and it is Linaro 2013.04. iconv is a part of glibc in
> such configuration as far as I know. I have also selected "Copy GCONV
> libraries to target" option and "Generate locale data" for cs_CZ.CP1250
> cs_CZ.UTF-8 cs_CZ.ISO-8859-2 - I'm interested mainly in these encodings.
>
> Unfortunately in such case iconv -l still shows only a few basic encodings
> but ISO-8859-2 nor CP1250 are present. (CP1250.so and ISO8859-2.so exists in
> /usr/lib/gconv)
>
> Is it possible to add required encodings iconv support somehow, please?
>
> with best regards
> Jan
