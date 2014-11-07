From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Fri, 07 Nov 2014 17:35:58 +0100
Subject: [Buildroot] host ldconfig package
In-Reply-To: <CAM7q1LnRANa1wFbb=5o8yuyYyJrQyU_CUDqTaNwQ7tC7905L-A@mail.gmail.com>
References: <CAM7q1LnRANa1wFbb=5o8yuyYyJrQyU_CUDqTaNwQ7tC7905L-A@mail.gmail.com>
Message-ID: <1456757.71s6JAxXJf@aquila>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Jeff,


On Thursday 06 November 2014 15:42:30 Jeff Horn wrote:
> Hi,
> 
> I am using buildroot for one of our i.MX6 based boards and I have it mostly
> working ( I can't get video to work ).
As far as I understand, fixing ldconfig issue is not sufficient to make
video work? Can you describe issue you are facing?


For information, I made iMX6 hardware video decoding and display work. You
may encounter a few difficulties:

  - Xorg support for imx6 is not yet merged (and we are looking for 
    testers :-) )

  - /etc/ld.so.conf have to contains these paths:
       /usr/lib/imx-mm/audio-codec
       /usr/lib/imx-mm/video-codec
       /usr/lib/imx-mm/parser
    (I have to write a patch for this)


-- 
J?r?me Pouiller, Sysmic
