From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 6 Feb 2019 15:54:54 +0100
Subject: [Buildroot] [PATCH 01/16] package/gnuradio: remove qtgui option
In-Reply-To: <20190206155211.6315edb3@windsurf>
References: <20190206141058.24155-1-peter@korsgaard.com>
 <20190206153950.0ac9aa42@x230> <20190206155211.6315edb3@windsurf>
Message-ID: <4a5bc7bb-5812-61b7-79f5-54101dc5d915@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 06/02/2019 15:52, Thomas Petazzoni wrote:
> Hello,
> 
> On Wed, 6 Feb 2019 15:39:50 +0100
> Gwenhael Goavec-Merou <gwenj@trabucayre.com> wrote:
> 
>> I'm not really happy by removing QT support. It's true, current version use QT4
>> and python2.7 but github master uses QT5 and python3. Instead of removing this
>> option (with the need to re-add soon) it's maybe a better idea to use a more
>> recent hash (or backporting debian patch) to switch to QT5.
>> I don't know which version is better;
> 
> We have marked Qt4 obsolete a year ago, it's no longer maintained, and
> it doesn't build with OpenSSL 1.1, it's really time to remove it.
> 
> We will happily take a follow-up patch that re-enables Qt support in
> gnuradio once the gnuradio package in Buildroot uses a sufficiently
> recent version of it that has Qt5 support.

 Also note that the qt5 integration in gnuradio.mk will anyway need to be very
different from the current qt4 integration, so it's OK to remove it first and
add later.

 BTW, series applied to master, thanks.


 Regards,
 Arnout
