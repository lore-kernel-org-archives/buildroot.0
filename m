From: Kenneth Adam Miller <kennethadammiller@gmail.com>
Date: Mon, 21 Nov 2016 14:10:25 -0500
Subject: [Buildroot] Uclibc shm performance issue
In-Reply-To: <CAK7rcp_J_LFvzHyCSbNrgZOz==zFHQ4H2fRrPe0pYJFUwPeX9g@mail.gmail.com>
References: <CAK7rcp_18Ygbkafq--7qii_9gF-7FrXq7W2iv6EL2vd9efLUxw@mail.gmail.com>
 <CAK7rcp_Z6M4aTp_f8v_Qr5ZEXjnR96pK8eAhx9D7Gs1n6_c_ig@mail.gmail.com>
 <CAK7rcp8e9cAKD0hMrhjE0Fjd64sc_8MdYk1Mnc4D0zozpSMv1w@mail.gmail.com>
 <CAK7rcp9DChiLzazH3gA-YSZ9+HFtQakLbwo6zK-BLAeDqMTHYw@mail.gmail.com>
 <CAK7rcp9R=4had7MJx5MQwqROZh39pYU7WVkgqoFj=qvNV-vzQw@mail.gmail.com>
 <CAK7rcp-LTN68VXOUZOKu_jET9WN5-F1iAQivLe3WsU0zO6iQcg@mail.gmail.com>
 <CAK7rcp_MQbDUFtr2F-GNYU=Mz_5N-0Jv-Yh3aYqr6HOFqvGPxw@mail.gmail.com>
 <CAK7rcp9Rv-JMX=inPMinGZ22LHe+rt0HHfNDTrkj5xaU-hQi3A@mail.gmail.com>
 <CAK7rcp_J_LFvzHyCSbNrgZOz==zFHQ4H2fRrPe0pYJFUwPeX9g@mail.gmail.com>
Message-ID: <CAK7rcp-2ANhykJACZdPJfmaHm106-Z6W3O80jzogYgk1m3+_mg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I'm using an absolutely miniscule fully compiled test inside a custom linux
built by buildroot with uclibc, and I'm opening and memcpy'ing raw data
into a shm region shared between two processes. On my host, I get fantastic
performance of course, gigabytes per second as expected. Therefore I know
that the code that I wrote is fast. But when I move it to run inside our
booted image, I take a huge performance hit. I'm not sure what the source
is, but I wanted to know if anybody would think that uclibc would affect
performance so dramatically, or if there could be some buildroot specific
option that I could change that would improve things. There are two layers
of performance penalty in fact, one just moving into the custom linux, and
another when we drive our C library with Ruby. I understand that that is to
be expected but for me, i dont think that the penalty should be so enormous
for that as well. Perhaps grsec could be affecting it?
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20161121/e1eb3f00/attachment.html>
