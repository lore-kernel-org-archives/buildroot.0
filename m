From: Luca Ceresoli <list@lucaceresoli.net>
Date: Sat, 15 Jan 2011 13:23:01 +0100
Subject: [Buildroot] [PATCH 1/2] liberation: add support for custom
 target directory
In-Reply-To: <20110114181254.3e773a18@surf>
References: <20110114094756.4f6d1747@surf>	<LF0UP9$6C050B5F0CF790CC5FFC45AB98AF886D@aruba.it>
	<20110114181254.3e773a18@surf>
Message-ID: <4D3191A5.4070002@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni wrote:
> On Fri, 14 Jan 2011 17:48:45 +0100
> "Luca Ceresoli" <list@lucaceresoli.net> wrote:
>
>   
>>> That could be one solution. The other solution would be to hide this
>>> from the user, i.e an unvisible configuration option to select the
>>> installation location of the fonts (i.e ? fonts in subdirs ? or ? all
>>> fonts in /usr/share/fonts ?). ? fonts in subdirs ? would be the
>>> default, and ? all fonts in /usr/share/fonts/ ? would be selected by
>>> Nano-X/Microwindows. This way, the user wouldn't have to worry about
>>> the installation location of fonts.
>>>       
>> That would not be enough in my case.
>> I don't use Nano-x/Microwin, my setup is based on qt + directfb + freetype.
>> I am not sure which of these components needs fonts in a specific dir,
>> but if fonts are in subdirs they won't be found.
>>     
>
> Sorry, but I do not understand why it wouldn't be enough. If you need
> all the fonts in a single directory, you would just select the ? all
> fonts in /usr/share/fonts ? case, and that would work, no ?
>   

I was commenting on the *automatic* choice of the font location. You 
proposed an algorithm that would install fonts in a unique directory if 
microwin is installed. I only wanted ti point out that the condition 
should include other packages, i.e. it should install in a unique dir if 
microwin or qt or directfb or freetype are installed.

I am not against automatic choice, but the buildroot user would be more 
conscious of what's going on if there were an explicit item in 
menuconfig. Of course the most reasonable default value for such an item 
would be "microwin or qt or...", and a couple lines explaining that in 
the help would be wise.


Luca
