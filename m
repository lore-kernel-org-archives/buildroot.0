From: Mark Jackson <mpfj-list@mimc.co.uk>
Date: Wed, 23 Sep 2009 15:09:40 +0100
Subject: [Buildroot] Problem with defconfig
In-Reply-To: <871vlxrf0o.fsf@macbook.be.48ers.dk>
References: <4AB9F39B.4090300@mimc.co.uk>
	<874oqurm9z.fsf@macbook.be.48ers.dk>	<4AB9FE2D.1080009@mimc.co.uk>
	<87my4lrke1.fsf@macbook.be.48ers.dk>	<4ABA02F3.6020706@mimc.co.uk>
	<87eipxrfz0.fsf@macbook.be.48ers.dk>	<4ABA187A.5010709@mimc.co.uk>
	<871vlxrf0o.fsf@macbook.be.48ers.dk>
Message-ID: <4ABA2C24.2080601@mimc.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter Korsgaard wrote:
>>>>>> "Mark" == Mark Jackson <mpfj-list@mimc.co.uk> writes:
> 
> Hi,
> 
>  >> %_defconfig: $(CONFIG)/conf
>  >> cp $(shell find ./target/ -name $@) .config
>  >> -@$(MAKE) oldconfig
> 
>  Mark> I looked at this and put in some @echo lines before and after the cp.
>  Mark> They were never executed !?!  Is this some bash / dash setup thing ?
> 
> Well, they shouldn't as make complains that it doesn't know how to make
> the rule, but I don't get why.
> 
> Does it work if you change the %_defconfig to atngw100-base_defconfig ?

It's different ...

mpfj at mpfj-x64:~/avr32/buildroot$ make atngw100-base_defconfig
cc   package/config/conf.o   -o package/config/conf
package/config/conf.o: In function `conf_askvalue':
/home/mpfj/avr32/buildroot-git/package/config/conf.c:80: undefined reference to `sym_get_type'
/home/mpfj/avr32/buildroot-git/package/config/conf.c:88: undefined reference to `sym_is_changable'
package/config/conf.o: In function `get_help':
/home/mpfj/avr32/buildroot-git/package/config/conf.c:45: undefined reference to `menu_has_help'
/home/mpfj/avr32/buildroot-git/package/config/conf.c:46: undefined reference to `menu_get_help'
package/config/conf.o: In function `conf_sym':
/home/mpfj/avr32/buildroot-git/package/config/conf.c:166: undefined reference to `sym_get_type'
/home/mpfj/avr32/buildroot-git/package/config/conf.c:182: undefined reference to `sym_tristate_within_range'
/home/mpfj/avr32/buildroot-git/package/config/conf.c:186: undefined reference to `menu_has_help'
/home/mpfj/avr32/buildroot-git/package/config/conf.c:189: undefined reference to `sym_get_string_value'
/home/mpfj/avr32/buildroot-git/package/config/conf.c:180: undefined reference to `sym_tristate_within_range'
/home/mpfj/avr32/buildroot-git/package/config/conf.c:184: undefined reference to `sym_tristate_within_range'
/home/mpfj/avr32/buildroot-git/package/config/conf.c:186: undefined reference to `menu_has_help'
/home/mpfj/avr32/buildroot-git/package/config/conf.c:220: undefined reference to `sym_set_tristate_value'
/home/mpfj/avr32/buildroot-git/package/config/conf.c:220: undefined reference to `sym_set_tristate_value'
/home/mpfj/avr32/buildroot-git/package/config/conf.c:220: undefined reference to `sym_set_tristate_value'
package/config/conf.o: In function `conf_string':
/home/mpfj/avr32/buildroot-git/package/config/conf.c:132: undefined reference to `sym_get_string_value'
/home/mpfj/avr32/buildroot-git/package/config/conf.c:133: undefined reference to `sym_get_string_value'
/home/mpfj/avr32/buildroot-git/package/config/conf.c:151: undefined reference to `sym_set_string_value'
package/config/conf.o: In function `conf':
/home/mpfj/avr32/buildroot-git/package/config/conf.c:353: undefined reference to `menu_is_visible'
/home/mpfj/avr32/buildroot-git/package/config/conf.c:368: undefined reference to `menu_get_prompt'
package/config/conf.o: In function `conf_choice':
/home/mpfj/avr32/buildroot-git/package/config/conf.c:235: undefined reference to `sym_get_type'
/home/mpfj/avr32/buildroot-git/package/config/conf.c:237: undefined reference to `sym_is_changable'
/home/mpfj/avr32/buildroot-git/package/config/conf.c:263: undefined reference to `menu_get_prompt'
/home/mpfj/avr32/buildroot-git/package/config/conf.c:268: undefined reference to `menu_is_visible'
/home/mpfj/avr32/buildroot-git/package/config/conf.c:280: undefined reference to `menu_get_prompt'
/home/mpfj/avr32/buildroot-git/package/config/conf.c:253: undefined reference to `menu_get_prompt'
/home/mpfj/avr32/buildroot-git/package/config/conf.c:293: undefined reference to `menu_has_help'
/home/mpfj/avr32/buildroot-git/package/config/conf.c:326: undefined reference to `menu_is_visible'
/home/mpfj/avr32/buildroot-git/package/config/conf.c:271: undefined reference to `menu_get_prompt'
package/config/conf.o: In function `sym_set_choice_value':
/home/mpfj/avr32/buildroot-git/package/config/lkc.h:142: undefined reference to `sym_set_tristate_value'
package/config/conf.o: In function `conf_choice':
/home/mpfj/avr32/buildroot-git/package/config/conf.c:239: undefined reference to `sym_calc_value'
package/config/conf.o: In function `check_conf':
/home/mpfj/avr32/buildroot-git/package/config/conf.c:414: undefined reference to `menu_is_visible'
/home/mpfj/avr32/buildroot-git/package/config/conf.c:419: undefined reference to `sym_is_changable'
/home/mpfj/avr32/buildroot-git/package/config/conf.c:423: undefined reference to `menu_get_parent_menu'
package/config/conf.o: In function `main':
/home/mpfj/avr32/buildroot-git/package/config/conf.c:498: undefined reference to `conf_parse'
/home/mpfj/avr32/buildroot-git/package/config/conf.c:546: undefined reference to `conf_read_simple'
/home/mpfj/avr32/buildroot-git/package/config/conf.c:585: undefined reference to `rootmenu'
/home/mpfj/avr32/buildroot-git/package/config/conf.c:584: undefined reference to `rootmenu'
/home/mpfj/avr32/buildroot-git/package/config/conf.c:592: undefined reference to `rootmenu'
/home/mpfj/avr32/buildroot-git/package/config/conf.c:601: undefined reference to `conf_get_changed'
/home/mpfj/avr32/buildroot-git/package/config/conf.c:614: undefined reference to `conf_write_autoconf'
/home/mpfj/avr32/buildroot-git/package/config/conf.c:601: undefined reference to `conf_write'
/home/mpfj/avr32/buildroot-git/package/config/conf.c:517: undefined reference to `conf_read'
/home/mpfj/avr32/buildroot-git/package/config/conf.c:527: undefined reference to `conf_read'
/home/mpfj/avr32/buildroot-git/package/config/conf.c:577: undefined reference to `conf_set_all_new_symbols'
/home/mpfj/avr32/buildroot-git/package/config/conf.c:568: undefined reference to `conf_set_all_new_symbols'
/home/mpfj/avr32/buildroot-git/package/config/conf.c:574: undefined reference to `conf_set_all_new_symbols'
/home/mpfj/avr32/buildroot-git/package/config/conf.c:571: undefined reference to `conf_set_all_new_symbols'
/home/mpfj/avr32/buildroot-git/package/config/conf.c:580: undefined reference to `conf_set_all_new_symbols'
/home/mpfj/avr32/buildroot-git/package/config/conf.c:555: undefined reference to `conf_get_changed'
/home/mpfj/avr32/buildroot-git/package/config/conf.c:500: undefined reference to `conf_get_configname'
/home/mpfj/avr32/buildroot-git/package/config/conf.c:548: undefined reference to `conf_read_simple'
/home/mpfj/avr32/buildroot-git/package/config/conf.c:535: undefined reference to `conf_read_simple'
/home/mpfj/avr32/buildroot-git/package/config/conf.c:516: undefined reference to `conf_get_default_confname'
collect2: ld returned 1 exit status
make: *** [package/config/conf] Error 1
mpfj at mpfj-x64:~/avr32/buildroot$ 

> 
>  >> So I don't get it why it doesn't trigger for you. Does a simple 'make
>  >> blah_defconfig' work for you?
> 
>  Mark> No ... everything comes up "no rule to make".
> 
> strange.
> 
>  >> Does it work with the 2009.08 release? What version of make are you using?
> 
>  Mark> 2009.08 release of buildroot ?  It's not out yet is it ?
> 
> Ehh, yes it is. We're no longer in August ;)
> 
> http://buildroot.net/downloads/buildroot-2009.08.tar.bz2

Ah yes ... but weirdly the home cgit page at http://git.buildroot.net/buildroot
only shows 2009.08_rc2 as the latest tag.  Clicking on the [...] below the tag
list shows a different story ???

Mark
